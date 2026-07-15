resource "cloudflare_dns_record" "api_dns_record" { 
  zone_id = "9f972faead41f77ac6ef88971ed3caf9" #replace with your own zone_id
  name = "api.roshankhatri8848.com.np"
  ttl = 1
  type = "A"
  content = "${aws_instance.roshan-instance.public_ip}"
  proxied = true
}
resource "cloudflare_dns_record" "frontend_dns_record" {
  zone_id = "9f972faead41f77ac6ef88971ed3caf9" #replace with your own zone_id
  name = "contactmanager.roshankhatri8848.com.np"
  ttl = 1
  type = "A"
  content = "${aws_instance.roshan-instance.public_ip}"
  proxied = true
}