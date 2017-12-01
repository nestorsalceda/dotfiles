function __ruby_version --description "Return active ruby version"
  echo (rbenv local ^/dev/null)
end
