package test;

import org.openqa.selenium.*;
import org.openqa.selenium.remote.*;
import java.net.URL;
import java.util.concurrent.TimeUnit;

public class SeleniumTest {
    private WebDriver driver;

    public void setUp() throws Exception {
        DesiredCapabilities capabilities = DesiredCapabilities.chrome();
        driver = new RemoteWebDriver(new URL("http://localhost:4444/wd/hub"), capabilities);
        driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
       // driver.driver.manage().window().maximize();
       // driver.manage().window().maximize();
       // driver.manage().window().maximize();
        driver.manage().window().setPosition(new Point(0, 0));
        driver.manage().window().setSize(new Dimension(1440, 900));
    }

    public void testSimple() throws Exception {
        this.driver.get("http://www.google.com");
        System.out.println("Title: "+ this.driver.getTitle());
    }

    public void tearDown() throws Exception {
        this.driver.quit();
    }

    public static void main(String[] args) {
        SeleniumTest test = new SeleniumTest();
        try {
            System.out.println("Setup");
            test.setUp();
            System.out.println("Testing");
            test.testSimple();
            System.out.println("Done");
            test.tearDown();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

}