
package hibernate_test;
import org.junit.Assert;
import org.junit.runner.RunWith;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration("src/main/webapp")
@ContextConfiguration(locations = {"classpath:springmvc-servlet.xml"})
@Transactional(transactionManager="transactionManager")
@Rollback(false)
public class BaseTest extends Assert {
	
	
	
	

}
