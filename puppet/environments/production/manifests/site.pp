filebucket { 'main':
  server => $::servername,
  path   => false,
}

File { backup => 'main' }

$force_noop = hiera('force_noop')
unless false == $force_noop {
  notify { "Puppet noop safety latch is enabled in site.pp!": }
  noop()
}

hiera_include('classes')
