use utf8;
package Schema::Result::Manager;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Schema::Result::Manager

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<manager>

=cut

__PACKAGE__->table("manager");

=head1 ACCESSORS

=head2 manager_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 date_create

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "manager_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "user_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "date_create",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</manager_id>

=back

=cut

__PACKAGE__->set_primary_key("manager_id");

=head1 RELATIONS

=head2 user

Type: belongs_to

Related object: L<Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "Schema::Result::User",
  { user_id => "user_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-08-17 13:54:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:y0Gzu0OytnI651LiUJtAPQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
