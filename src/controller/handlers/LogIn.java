package controller.handlers;

import domain.Person;
import domain.PersonService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class LogIn extends RequestHandler {

    @Override
    public String handleRequest(HttpServletRequest request,
                                HttpServletResponse response) throws ServletException, IOException {
        List<String> errors = new ArrayList<String>();

        String email = request.getParameter("email");
        if (email == null || email.isEmpty()) {
            errors.add("No email given");
        }

        String password = request.getParameter("password");
        if (password == null || password.isEmpty()) {
            errors.add("No password given");
        }

        if (errors.size() == 0) {
            PersonService personService = super.getPersonService();
            Person person = personService.getAuthenticatedUser(email, password);
            if (person != null) {
                person.setState("ONLINE");
                request.setAttribute("title", "Chat App");
                createSession(person, request, response);
            } else {
                errors.add("No valid email/password");
            }
        }

        if (errors.size() > 0) {
            request.setAttribute("errors", errors);
        }
        return destination;
    }

    private void createSession(Person person, HttpServletRequest request,
                               HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.setAttribute("user", person);
    }

}
