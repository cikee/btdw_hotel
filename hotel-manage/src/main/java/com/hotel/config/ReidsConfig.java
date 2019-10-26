package com.hotel.config;



import java.util.HashSet;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import redis.clients.jedis.HostAndPort;
import redis.clients.jedis.JedisCluster;

@Configuration
@PropertySource("classpath:/properties/redis.properties")
public class ReidsConfig {
	@Value("${redis.nodes}")
	private String nodes;
	
	@Bean
	public JedisCluster jedisCluster() {
		HashSet<HostAndPort> nodeSet = new HashSet<HostAndPort>();
		String[] arraynodes = nodes.split(",");
		for (String node : arraynodes) {
			String host=node.split(":")[0];
			String sport=node.split(":")[1];
			int port = Integer.parseInt(sport);
			nodeSet.add(new HostAndPort(host, port));
		}
		return new JedisCluster(nodeSet);
	}
	
}
