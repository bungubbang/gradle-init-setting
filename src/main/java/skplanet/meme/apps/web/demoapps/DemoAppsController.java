package skplanet.meme.apps.web.demoapps;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

/**
 * Created with IntelliJ IDEA.
 * User: bungubbang
 * Date: 13. 2. 26.
 * Time: 오전 11:35
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping(value = "/apps")
public class DemoAppsController {

    @Autowired
    RestTemplate restTemplate;

    private String jsHost = "http://1.234.90.172:9091/";

    @RequestMapping(value = "/googlemap", method = RequestMethod.GET)
    public String googleMap(ModelMap modelMap){
        modelMap.addAttribute("jsHost",jsHost);
        return "demoapps/googleMap";
    }

    @RequestMapping(value = "/melon", method = RequestMethod.GET)
    public String melon(){
        return "demoapps/melon";
    }



}
