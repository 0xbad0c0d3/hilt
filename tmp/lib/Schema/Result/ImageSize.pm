use utf8;
package Schema::Result::ImageSize;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Schema::Result::ImageSize

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<image_size>

=cut

__PACKAGE__->table("image_size");

=head1 ACCESSORS

=head2 image_size_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 w

  data_type: 'integer'
  is_nullable: 1

=head2 h

  data_type: 'integer'
  is_nullable: 1

=head2 path

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 title

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=cut

__PACKAGE__->add_columns(
  "image_size_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "w",
  { data_type => "integer", is_nullable => 1 },
  "h",
  { data_type => "integer", is_nullable => 1 },
  "path",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "title",
  { data_type => "varchar", is_nullable => 0, size => 45 },
);

=head1 PRIMARY KEY

=over 4

=item * L</image_size_id>

=back

=cut

__PACKAGE__->set_primary_key("image_size_id");

=head1 RELATIONS

=head2 product2images

Type: has_many

Related object: L<Schema::Result::Product2image>

=cut

__PACKAGE__->has_many(
  "product2images",
  "Schema::Result::Product2image",
  { "foreign.image_size_id" => "self.image_size_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-06-06 10:19:04
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:IJ4mK2kTz1mXKXn9hMU3uw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
