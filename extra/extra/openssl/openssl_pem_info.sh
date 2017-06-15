function openssl_pem_info() {
  if [ $# = 0 ]; then
    echo 'require: path_to_pem'
  else
    openssl x509 -text -noout -in $1
  fi
}
