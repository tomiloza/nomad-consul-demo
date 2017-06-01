package codecentric.de.rest.controller;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

/**
 * Created by tomislavlozancic on 01.06.17.
 */
@Path("/hello")
public class HelloWorldController {

    @GET
    @Path("/")
    public Response getEmployeeById() {
        return Response.ok("Simple Java Dropwizzard app").build();
    }

}
