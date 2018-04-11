package za.co.bsg.config;

import org.mockito.Mockito;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.kubernetes.discovery.KubernetesDiscoveryClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import java.util.Collections;

import static org.mockito.Mockito.when;

/**
 * Overrides Discovery Client, so they do not interfere the testing
 * This configuration must be included in @SpringBootTest in order to take effect.
 */
@Configuration
public class DiscoveryClientOverrideConfiguration {

    @Bean
    @Primary
    public DiscoveryClient discoveryClient() {
        KubernetesDiscoveryClient client = Mockito.mock(KubernetesDiscoveryClient.class);
        when(client.getServices()).thenReturn(Collections.emptyList());
        return client;
    }
}
