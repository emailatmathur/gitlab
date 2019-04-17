provider "aws" {
        region = "us-east-1"
}

resource "aws_key_pair" "terraform-demo" {
  key_name   = "terraform-demo"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD/PN3JeYfxErIkIKtoOoSJTQ62qDrUgoBdjzwge+yyY71JZE5PXsb3JcRc0HcMN96LUhNgrtpA07s/UEJ8uuZGt7ww8qUPl21zrz2cAWZCbfXcI3ZxJU2CNj8XfnFiRNTmaRVa09TMco3rHDV72u1p/m9+CnAQ3wIRXBxEWiiRsB3D+ChmHruJgU6ky/PhJfTPwGHDUR5EyfwtFyzYC2ZsbvtQ5u//8zW3aZRFDmITjRcOUNYN5h1K+w2NNv6bsB8Kqr03F0uz5pQBbx0UFINpw2oHZ9sxTWunyQQ/ZtE6POV2oaFfdYE/Q/6ThpCnDDm8k3rMqMtuN7yyxN8760XZ root@jenkins.tleaf.com"
}

resource "aws_instance" "my-instance" {
        ami = "ami-04169656fea786776"
        instance_type = "t2.nano"
		key_name = "${aws_key_pair.terraform-demo.key_name}"
        tags = {
                Name = "Terraform"
                Batch = "5AM"
        }
}
