package My::List;
use strict;
use warnings;
use My::ListIterator;
use Element;
use Data::Dumper;

sub new {
    my ($class) = @_;
    my $elem = Element->new;
    my $data_structure = {
        head => \$elem,
        tail => \$elem,
        length => 0,
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
    $self->{length}++;
}

sub get_list_at {
    my ($self,$index) = @_;
    my $iter = $self->iterator;
    return ${$self->{head}} if($index < 0 || !$iter->has_next);
    for(my $i=0;$i<$index;$i++){
        $iter->next;
    }
    return $iter->next;
}

sub get_length {
    my ($self) = @_;
    return $self->{length};
}

sub remove {
    my ($self,$index) = @_;
    $self->get_list_at($index-1)->{next} = \$self->get_list_at($index+1);
    $self->{length}--;
    return $self->{length};
}

1;
