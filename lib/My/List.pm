package My::List;
use strict;
use warnings;
use base qw/Aggregate/;
use My::ListIterator;
use Element;

sub new {
		my ($class) = @_;
		my $data_structure = {
				elems => [],
		};
		my $self = bless $data_structure, $class;
		return $self;
}

sub iterator {
		my ($self) = @_;
		return My::ListIterator->new($self);
}

sub append {
		my ($self,$value) = @_;
		push(@{$self->{elems}},Element->new($value));
}

sub get_list_at {
		my ($self,$index) = @_;
		return $self->{elems}->[$index];
}

sub get_length {
		my ($self) = @_;
		return scalar @{$self->{elems}};
}

1;
