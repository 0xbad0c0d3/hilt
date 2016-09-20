use utf8;
package Schema::Result::Image2bannerMain;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Schema::Result::Image2bannerMain

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<image2banner_main>

=cut

__PACKAGE__->table("image2banner_main");

=head1 ACCESSORS

=head2 image_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 md5_hex

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 w

  data_type: 'integer'
  is_nullable: 0

=head2 h

  data_type: 'integer'
  is_nullable: 0

=head2 origin_name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 path

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 date_create

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 date_update

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 sort

  data_type: 'integer'
  is_nullable: 0

=head2 url

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 position

  data_type: 'tinyint'
  is_nullable: 0

=head2 text

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 valid_from

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 valid_till

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "image_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "md5_hex",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "w",
  { data_type => "integer", is_nullable => 0 },
  "h",
  { data_type => "integer", is_nullable => 0 },
  "origin_name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "path",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "user_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "date_create",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
  },
  "date_update",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "sort",
  { data_type => "integer", is_nullable => 0 },
  "url",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "position",
  { data_type => "tinyint", is_nullable => 0 },
  "text",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "valid_from",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "valid_till",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</image_id>

=back

=cut

__PACKAGE__->set_primary_key("image_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<md5_UNIQUE>

=over 4

=item * L</md5_hex>

=back

=cut

__PACKAGE__->add_unique_constraint("md5_UNIQUE", ["md5_hex"]);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-19 16:17:16
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HQjuTfMw8lFo9m1fu1W++Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
