
resource "cloudflare_api_token" "%[1]s" {
	name = "%[1]s"
	status = "active"

	policies = [{
		effect = "allow"
		permission_groups = [{
	    	id = "%[2]s"
		}]
		resources = { "com.cloudflare.api.account.zone.*" = "*" }
	}]

	condition = {
		request_ip = {
				in     = ["192.0.2.1/32"]
				not_in = ["198.51.100.1/32"]
			}
	}
}
