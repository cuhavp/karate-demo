package examples.booking;

import com.intuit.karate.junit5.Karate;

public class DemoTest {

    @Karate.Test
    Karate authTest(){
        return new Karate().feature("auth").
                tags("@auth").
                relativeTo(getClass());
    }
}
