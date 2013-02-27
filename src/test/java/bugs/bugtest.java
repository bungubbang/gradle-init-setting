package bugs;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.client.RestTemplate;

/**
 * Created with IntelliJ IDEA.
 * User: bungubbang
 * Date: 13. 2. 26.
 * Time: 오후 2:28
 * To change this template use File | Settings | File Templates.
 */
public class bugtest {

    @Autowired
    RestTemplate restTemplate;

    @Test
    public void bugstest() {
        String bugs = restTemplate.getForObject("http://www.bugs.co.kr/", String.class);
        System.out.println(bugs);
    }
}
