package Git::HomeSync::Command::config;
use Git::HomeSync -command;

sub abstract { 'Update user.name to CURRENT_USER@CURRENT_HOSTNAME' }

sub execute {
    my ( $self, $opt, $args ) = @_;

    my $git_config_cmd =
        sprintf q{git config --replace-all user.name '%s@%s'},
        $self->user, $self->hostname;

    Git::HomeSync::Util->run_cmd(
        {   dry_run => 1,
            cmd     => $git_config_cmd,
        }
    );
}

1;