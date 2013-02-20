class prerequisites {

  package {
    "vim":
      name => "vim",
      ensure  => installed,
  }

  package {
    "rake":
      provider => gem,
  }

  package {
    "bundler":
      provider => gem,
  }

}
