package skplanet.meme.config;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.Filter;

/**
 * Created with IntelliJ IDEA.
 * User: bungubbang
 * Date: 13. 2. 26.
 * Time: 오전 11:13
 * To change this template use File | Settings | File Templates.
 */
public class MemeAppsWebApplicationInitializer extends AbstractAnnotationConfigDispatcherServletInitializer{


    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class<?>[0];  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class<?>[]{MemeAppsWebApplicationConfig.class};  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};  //To change body of implemented methods use File | Settings | File Templates.
    }


    @Override
    protected Filter[] getServletFilters() {
        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
        characterEncodingFilter.setEncoding("UTF-8");
        characterEncodingFilter.setForceEncoding(true);

        return new Filter[]{characterEncodingFilter};    //To change body of overridden methods use File | Settings | File Templates.
    }
}
