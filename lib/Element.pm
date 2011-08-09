package Element;
use strict;
use warnings;

sub new {
		my ($class,$value) = @_;
		my $data_structure = {
				value => $value,
		};
		my $self = bless $data_structure, $class;
		return $self;
}

sub value {
		my ($self) = @_;
		return $self->{value};
}




1;

