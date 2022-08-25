resource "local_file" "api-dotenv" {
  content = templatefile("api-dotenv.tmpl", {})
  filename = format("%s/%s", abspath(path.root), "api.env")
}

