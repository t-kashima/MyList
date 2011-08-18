package My::ListIterator;
use strict;
use warnings;
use My::List;

sub new {
    my ($class,$elem) = @_;
    my $data_structure = {
        elem => \$elem
    };
    my $self = bless $data_structure,$class;
    return $self;
}

sub next {
    my ($self) = @_;
    if($self->has_next){
        $self->{elem} = ${$self->{elem}}->{next};
        return ${$self->{elem}};
    }
    return;
}

sub has_next {
    my ($self) = @_;
    ${$self->{elem}}->next ? 1 : 0;
}

1;
