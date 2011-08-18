package My::List;
use strict;
use warnings;
use My::ListIterator;
use Element;

sub new {
    my ($class) = @_;
    my $elem = Element->new;
    my $data_structure = {
        head => \$elem,
        tail => \$elem,
    };
    my $self = bless $data_structure, $class;
    return $self;
}

sub iterator {
    my ($self) = @_;
    return My::ListIterator->new(${$self->{head}});
}

sub append {
    my ($self,$value) = @_;
    my $elem = Element->new($value);
    ${$self->{tail}}->{next} = \$elem; 
    $self->{tail} = \$elem;
}

=pod
sub get_list_at {
    my ($self,$index) = @_;
    return $self->{elems}->[$index];
}

sub get_length {
    my ($self) = @_;
    return scalar @{$self->{elems}};
}
=cut

1;
