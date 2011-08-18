package test::My::List;
use strict;
use warnings;
use base qw(Test::Class);
use Test::More;
use My::List;

sub init : Test(1) {
    new_ok 'My::List';
}

sub basic : Tests {
    my $list = My::List->new;
    isa_ok $list,'My::List';
    my $iter = $list->iterator;
    is $iter->has_next,0;

    $list->append("Hello");
    $list->append("World");			
    is $iter->has_next,1;

    $iter = $list->iterator;
    is $iter->next->value, "Hello";
    is $iter->next->value, "World";
    is $iter->next, undef;
}

sub values : Tests {
    my $list = My::List->new;
    $list->append("Hello");			
    $list->append(2011);
    $list->append([1,2,3,4,5]);
    $list->append({apple=>"red",banana=>"yellow"});

    my $iter = $list->iterator;
    is $iter->next->value, "Hello";
    is $iter->next->value, 2011;
    is_deeply [@{$iter->next->value}], [1,2,3,4,5];
    is $iter->next->value->{banana}, "yellow";
}

__PACKAGE__->runtests;

1;
