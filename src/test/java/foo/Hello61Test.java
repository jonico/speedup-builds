package foo;
import org.junit.Test;
import static org.junit.Assert.*;

public class Hello61Test {
    @Test public void one() {
        if (Math.random() < 0.015) {
            fail("oops");
        }
    }
    @Test public void two() {}
    @Test public void three() throws Exception {
        Thread.sleep(610);
    }
}
