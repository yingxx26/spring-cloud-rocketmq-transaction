package com.oujiong.service.produce;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
  * @ClassName: ProduceApplication
  * @Description: 商品服务启动类
  * @author xub
  * @date 2019/7/12 下午12:29
  */
@SpringBootApplication
@MapperScan("com.oujiong.service.*.mapper")
public class ProduceApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProduceApplication.class, args);
	}
}
