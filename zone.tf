resource "google_dns_managed_zone" "cloud-graphite-com" {
  name        = "cloud-graphite"
  dns_name    = "cloud-graphite.com."
  description = "DNS Zone for cloud-graphite.com"
}

resource "google_dns_record_set" "frontend" {
  name = "frontend.${google_dns_managed_zone.cloud-graphite-com.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = "${google_dns_managed_zone.cloud-graphite-com.name}"

  rrdatas = ["1.2.3.4"]
}
