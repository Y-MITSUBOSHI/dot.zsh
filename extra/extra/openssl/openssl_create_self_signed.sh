function openssl_create_self_signed() {
  if [ $# = 0 ]; then
    echo 'require: file_name (hoge.key, hoge.csr, hoge.pem'
  else
    openssl genrsa 2048 > ${1}.key
    openssl req -new -key ${1}.key > ${1}.csr
    openssl x509 -days 3650 -req -signkey ${1}.key < ${1}.csr > ${1}.pem
  fi
}
