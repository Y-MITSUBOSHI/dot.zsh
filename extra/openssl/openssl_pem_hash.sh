function openssl_pem_hash() {
  if [ $# = 0 ]; then
    echo 'require: path_to_pem(crt file)'
  else
    openssl x509 -noout -modulus -in $1 | openssl md5
  fi
}
