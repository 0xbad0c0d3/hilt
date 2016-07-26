use utf8;
package Schema::Result::Image2product;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Schema::Result::Image2product

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<image2product>

=cut

__PACKAGE__->table("image2product");

=head1 ACCESSORS

=head2 image2product_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 product_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 image_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 w

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 h

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 md5_hex

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 path

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 date_create

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 origin_name

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=cut

__PACKAGE__->add_columns(
  "image2product_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "product_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "image_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "w",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "h",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "md5_hex",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "path",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "date_create",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
  },
  "user_id",
  { data_type => "integer", is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "origin_name",
  { data_type => "varchar", is_nullable => 1, size => 128 },
);

=head1 PRIMARY KEY

=over 4

=item * L</image2product_id>

=back

=cut

__PACKAGE__->set_primary_key("image2product_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<md5_hex_UNIQUE>

=over 4

=item * L</md5_hex>

=item * L</path>

=back

=cut

__PACKAGE__->add_unique_constraint("md5_hex_UNIQUE", ["md5_hex", "path"]);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-07-26 10:51:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2s4SOa3HNkmS/uu8kMWLMA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
