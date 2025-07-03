package Java.Final.Exam.controller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

@Controller
public class ErrorController implements org.springframework.boot.web.servlet.error.ErrorController {

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request) {
        // Get the HTTP status code
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

        if (status != null) {
            int statusCode = Integer.parseInt(status.toString());

            // Handle different error status codes
            if (statusCode == HttpStatus.NOT_FOUND.value()) {
                // Return the appropriate view for 404 Not Found error
                return "error404";
            } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
                // Return the appropriate view for 500 Internal Server Error
                return "error500";
            }
            // Add more conditions for other error codes if needed
        }

        // Return a generic error view for other types of errors
        return "error";
    }

    public String getErrorPath() {
        return "/error";
    }
}