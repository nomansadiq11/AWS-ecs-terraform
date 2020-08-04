

output "ecr_name" {
    value = "${aws_ecr_repository.helloworldrepo.repository_url}"
}