function openssl_csr_hash() {
  if [ $# = 0 ]; then
    echo 'require: path_to_csr'
  else
    openssl req -noout -modulus -in $1 | openssl md5
  fi
}
