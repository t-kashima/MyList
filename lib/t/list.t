package test::My::List;
use strict;
use warnings;
use base qw(Test::Class);
use Test::More;
use My::List;

sub init : Test(1) {
    new_ok 'My::List';
}

sub scalar : Tests {
    my $list = My::List->new;
		my $iter = $list->iterator;
		is_deeply [$iter->has_next],[0];

		$list->append("Hello");			
		$list->append("World");
		$list->append(2011);
		$iter = $list->iterator;
		is_deeply [$iter->has_next],[1];
		$iter->next->value;
		is_deeply [$iter->next->value], ["World"];
}

sub refer : Tests {
		my $ref_a = [(1,2,3,4,5)];
    my $list = My::List->new;
		$list->append($ref_a);
		my $iter = $list->iterator;
		is_deeply [$iter->has_next],[1];
		is_deeply [@{$iter->next->value}[2]],[3];
}

__PACKAGE__->runtests;

1;
