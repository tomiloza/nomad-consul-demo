package codecentric.de;

import codecentric.de.rest.controller.HelloWorldController;
import io.dropwizard.Application;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HelloWorldApplication extends Application<HelloWorldConfiguration> {

    private static final Logger LOGGER = LoggerFactory.getLogger(HelloWorldApplication.class);

    public static void main(final String[] args) throws Exception {
        new HelloWorldApplication().run(args);
    }

    @Override
    public String getName() {
        return "HelloWorld";
    }

    @Override
    public void initialize(final Bootstrap<HelloWorldConfiguration> bootstrap) {


    }

    @Override
    public void run(final HelloWorldConfiguration configuration,
                    final Environment environment) {
        LOGGER.info("Registering REST resources");
        environment.jersey().register(new HelloWorldController());

    }

}
