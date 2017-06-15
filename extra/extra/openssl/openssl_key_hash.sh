function openssl_key_hash() {
  if [ $# = 0 ]; then
    echo 'require: path_to_private_key'
  else
    openssl rsa -noout -modulus -in $1 | openssl md5
  fi
}
