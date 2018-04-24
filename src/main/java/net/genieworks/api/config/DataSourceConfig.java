package net.genieworks.api.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

@Configuration
@EnableTransactionManagement
@MapperScan(basePackages = "net.genieworks.api.mapper")
public class DataSourceConfig {

	@Autowired
	private Environment env;

	@Bean
	public DataSource dataSource() {

		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName(env.getProperty("mybatis.driverClassName"));
		dataSource.setUrl(env.getProperty("mybatis.url"));
		dataSource.setUsername(env.getProperty("mybatis.username"));
		dataSource.setPassword(env.getProperty("mybatis.password"));

		dataSource.setDefaultQueryTimeout(0);
		return dataSource;
	}

	public Connection getBaseConnection() throws Exception {
		Class.forName(env.getProperty("mybatis.driverClassName"));
		return DriverManager.getConnection(env.getProperty("mybatis.url"),env.getProperty("mybatis.username"), env.getProperty("mybatis.password"));
	}

	@Bean
	public Connection getConnection(BasicDataSource ds) {

		DatabaseMetaData meta;
		Connection connection = null;

		try {
			meta = ds.getConnection().getMetaData();
			Class.forName(ds.getDriverClassName());
			connection = DriverManager.getConnection(meta.getURL(), ds.getUsername(), ds.getPassword());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return connection;
	}

	@Bean
	public SqlSessionFactoryBean sqlSessionFactoryForMyBatis(DataSource dataSource, ApplicationContext applicationContext) throws Exception {

		final SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource);
		sqlSessionFactoryBean.setConfigLocation(applicationContext.getResource(env.getProperty("mybatis.configLocation")));
		sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources(env.getProperty("mybatis.mapperLocations")));

		return sqlSessionFactoryBean;
	}

//	@Bean
//	public SqlSessionFactory sqlSessionFactory(ApplicationContext applicationContext) throws Exception {
//
//		final SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
//		sqlSessionFactoryBean.setDataSource(dataSource());
//
//		return sqlSessionFactoryBean.getObject();
//	}

	@Bean
	public DataSourceTransactionManager transactionManager() {

		return new DataSourceTransactionManager(dataSource());
	}

	@Bean
	public SqlSession sqlSessionForMyBatis(SqlSessionFactory sqlSessionFactory) {

		return new SqlSessionTemplate(sqlSessionFactory);
	}

}//end of class
