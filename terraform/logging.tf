# Multi-region CloudTrail for full audit coverage
resource "aws_cloudtrail" "security_trail" {
 name = "zero-trust-security-trail"
 s3_bucket_name = aws_s3_bucket.security_logs.id
 include_global_service_events = true
 is_multi_region_trail = true
 enable_logging = true
 event_selector {
 read_write_type = "All"
 include_management_events = true
 }
}
