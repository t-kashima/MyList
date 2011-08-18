package Element;
use strict;
use warnings;

sub new {
    my ($class,$value) = @_;
    my $data_structure = {
        value => $value || "",
        next => undef
    };
    my $self = bless $data_structure, $class;
    return $self;
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

sub has_next {
    my ($self) = @_;
    return $self->next;
}

sub next {
	my ($self) = @_;
	return $self->{next};
}


1;

