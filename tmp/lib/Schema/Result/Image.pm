use utf8;
package Schema::Result::Image;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Schema::Result::Image

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<image>

=cut

__PACKAGE__->table("image");

=head1 ACCESSORS

=head2 image_id

  data_type: 'integer'
  extra: {unsigned => 1}
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

=cut

__PACKAGE__->add_columns(
  "image_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
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

=head1 RELATIONS

=head2 product2images

Type: has_many

Related object: L<Schema::Result::Product2image>

=cut

__PACKAGE__->has_many(
  "product2images",
  "Schema::Result::Product2image",
  { "foreign.image_id" => "self.image_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-06-06 10:19:04
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:V+bzRCSfAHSvyfEOzHhIEA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
