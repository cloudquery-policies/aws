# Application Load Balancer should be configured to redirect all HTTP requests to HTTPS

This control checks whether HTTP to HTTPS redirection is configured on all HTTP listeners of Application Load Balancers. The control fails if any of the HTTP listeners of Application Load Balancers do not have HTTP to HTTPS redirection configured.

Before you start to use your Application Load Balancer, you must add one or more listeners. A listener is a process that uses the configured protocol and port to check for connection requests. Listeners support both the HTTP and HTTPS protocols. You can use an HTTPS listener to offload the work of encryption and decryption to your load balancer. To enforce encryption in transit, you should use redirect actions with Application Load Balancers to redirect client HTTP requests to an HTTPS request on port 443.

To learn more, see [Listeners for your Application Load Balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html) in _User Guide for Application Load Balancers_.

> This control is not supported in the following Regions.
>
> * Africa (Cape Town)
> * Asia Pacific (Osaka)
> * Europe (Milan)

## Related PCI DSS requirements

This control is related to the following PCI DSS requirements:

**PCI DSS 2.3 Encrypt all nonconsole administrative access using strong cryptography.**

> If you use Application Load Balancers with an HTTP listener, ensure that the listener is redirected to HTTPS for any nonconsole administrative access. Allowing unencrypted authentication over HTTP for administrators of the cardholder data environment might violate the requirement to encrypt all nonconsole administrative access using strong cryptography.

**PCI DSS 4.1 Use strong cryptography and security protocols to safeguard sensitive cardholder data during transmission over open, public networks.**

> If you use Application Load Balancers with an HTTP listener, ensure that the listener is redirected to HTTPS for any transmissions of cardholder data. Allowing unencrypted transmissions of cardholder data might violate the requirement to use strong cryptography and security protocols to safeguard sensitive cardholder data during transmission over open, public networks.

## Remediation

To remediate this issue, you redirect HTTP request to HTTPS.

**To redirect HTTP requests to HTTPS on an Application Load Balancer**

1. Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/.
2. In the navigation pane, under **Load Balancing**, choose **Load balancers**.
3. Choose an Application Load Balancer.
4. Choose **Listeners**.
5. Select the check box for an HTTP listener (port 80 TCP) and then choose **Edit**.
6. If there is an existing rule, you must delete it. Otherwise, choose **Add action** and then choose **Redirect to...**.
7. Choose **HTTPS** and then enter _443_.
8. Choose the check mark in a circle symbol and then choose **Update**.
