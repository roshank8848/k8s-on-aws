resource "cloudflare_dns_record" "api_dns_record" {
  zone_id = "12bff830f7c794620444ce897cc736d1"
  name = "roshan-api.roshankhatri08.com.np"
  ttl = 1
  type = "A"
  content = "${aws_instance.roshan-instance.public_ip}"
  proxied = true
}
resource "cloudflare_dns_record" "frontend_dns_record" {
  zone_id = "12bff830f7c794620444ce897cc736d1"
  name = "roshan.roshankhatri08.com.np"
  ttl = 1
  type = "A"
  content = "${aws_instance.roshan-instance.public_ip}"
  proxied = true
}