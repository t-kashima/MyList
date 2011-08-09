package My::ListIterator;
use strict;
use warnings;
use base qw/Iterator/;
use My::List;

sub new {
		my ($class,$list) = @_;
		my $data_structure = {
				list => $list,
				id   => 0,
		};
		my $self = bless $data_structure,$class;
		return $self;
}

sub has_next {
		my ($self) = @_;
		return $self->{id} < $self->{list}->get_length()? 1 : 0;
}

sub next {
		my ($self) = @_;
		my $elem = $self->{list}->get_list_at($self->{id});
		$self->{id}++;
		return $elem;
}

1;
