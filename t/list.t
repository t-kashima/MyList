package test::My::List;
use strict;
use warnings;
use base qw(Test::Class);
use Test::More;
use My::List;

sub init : Test(1) {
    new_ok 'My::List';
}

sub values : Tests {
    my $list = My::List->new;
		$list->append("Hello");			
		$list->append("World");
		$list->append(2011);
		my $iter = $list->iterator;
		$iter->has_next;
		is_deeply [$iter->next->value], ["World"];
}

__PACKAGE__->runtests;

1;
