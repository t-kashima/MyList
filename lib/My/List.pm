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

sub insert {
    my ($self,$index,$value) = @_;    
    my $elem = Element->new($value);    
    if(($self->{length}-1) < $index){
        $elem->{next} = ${$self->{tail}}->next;
        ${$self->{tail}}->{next} = \$elem;
    }
    $elem->{next} = $self->get_list_at($index)->next;
    $self->get_list_at($index)->{next} = \$elem;
}

sub remove {
    my ($self,$index) = @_;
    my $next_elem = $self->get_list_at($index+1);
    $self->get_list_at($index-1)->{next} = \$next_elem;
    $self->{length}--;
    return $self->{length};
}

1;
