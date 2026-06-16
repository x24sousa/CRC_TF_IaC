### Route 53 Zone ###
resource "aws_route53_zone" "route53_x24sousa" {
  comment                     = "HostedZone created by Route53 Registrar"
  enable_accelerated_recovery = false
  name                        = "x24sousa.com"

  # Prevent accidental deletion of this Route53 Zone
  lifecycle {
    prevent_destroy = true
  }
}



### DNS RECORDS ###

resource "aws_route53_record" "AAAA" {
  name    = "x24sousa.com"
  type    = "AAAA"
  zone_id = "Z05720531MSHK0AAJ0Q96"
  alias {
    evaluate_target_health = false
    name                   = "d24gghrejfkfcv.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
  }
}

resource "aws_route53_record" "A" {
  name    = "x24sousa.com"
  type    = "A"
  zone_id = "Z05720531MSHK0AAJ0Q96"
  alias {
    evaluate_target_health = false
    name                   = "d24gghrejfkfcv.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
  }
}

resource "aws_route53_record" "A_www" {
  #multivalue_answer_routing_policy = false
  name    = "www.x24sousa.com"
  type    = "A"
  zone_id = "Z05720531MSHK0AAJ0Q96"
  alias {
    evaluate_target_health = false
    name                   = "d24gghrejfkfcv.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
  }
}

resource "aws_route53_record" "AAAA_www" {
  name    = "www.x24sousa.com"
  type    = "AAAA"
  zone_id = "Z05720531MSHK0AAJ0Q96"
  alias {
    evaluate_target_health = false
    name                   = "d24gghrejfkfcv.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
  }
}







###### NO NEED TO TOUCH THESE RECORDS ######
resource "aws_route53_record" "SOA" {
  name    = "x24sousa.com"
  records = ["ns-411.awsdns-51.com. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl     = 900
  type    = "SOA"
  zone_id = "Z05720531MSHK0AAJ0Q96"
}

###### NO NEED TO TOUCH THESE RECORDS ######
resource "aws_route53_record" "NS" {
  name    = "x24sousa.com"
  records = ["ns-1286.awsdns-32.org.", "ns-1947.awsdns-51.co.uk.", "ns-411.awsdns-51.com.", "ns-803.awsdns-36.net."]
  ttl     = 172800
  type    = "NS"
  zone_id = "Z05720531MSHK0AAJ0Q96"
}


###### NO NEED TO TOUCH THESE RECORDS ######
resource "aws_route53_record" "CNAME" {
  name    = "_99cdba28aefb0537fb0b076af0f47efe.x24sousa.com"
  records = ["_ac8ed1ce82a7633834ab88fb2279a04b.jkddzztszm.acm-validations.aws."]
  ttl     = 300
  type    = "CNAME"
  zone_id = "Z05720531MSHK0AAJ0Q96"
}

###### NO NEED TO TOUCH THESE RECORDS ######
resource "aws_route53_record" "CNAME_www" {
  name    = "_e98b851502defb6ed48c5e8237cdbb7b.www.x24sousa.com"
  records = ["_ca733e76a34149128275a6ad6f9aa8fe.jkddzztszm.acm-validations.aws."]
  ttl     = 300
  type    = "CNAME"
  zone_id = "Z05720531MSHK0AAJ0Q96"
}