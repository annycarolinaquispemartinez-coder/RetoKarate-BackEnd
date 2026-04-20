package serveRest;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;

public class RunnerTest {
    @Test
    void testParallel() {
    Results results = Runner.path("classpath:serveRest/features")
        .tags("@Regresion")
        //.outputCucumberJson(true)
        .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
