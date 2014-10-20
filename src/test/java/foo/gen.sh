#!/bin/bash
for i in {1..100}; do
cat > Hello${i}Test.java << EOF
package foo;
import junit.framework.TestCase;

public class Hello${i}Test extends TestCase {
    public void test1() {}
    public void test2() {}
    public void test3() throws Exception {
        Thread.sleep(${i}0);
    }
}
EOF
done
