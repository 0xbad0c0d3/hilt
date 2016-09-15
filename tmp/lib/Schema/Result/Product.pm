use utf8;
package Schema::Result::Product;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Schema::Result::Product

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<product>

=cut

__PACKAGE__->table("product");

=head1 ACCESSORS

=head2 product_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 title

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 description

  data_type: 'varchar'
  is_nullable: 0
  size: 1000

=head2 date_create

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 date_update

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 og:title

  accessor: 'og_title'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 og:description

  accessor: 'og_description'
  data_type: 'varchar'
  is_nullable: 1
  size: 1000

=head2 og:image

  accessor: 'og_image'
  data_type: 'varchar'
  is_nullable: 1
  size: 1000

=head2 og:video

  accessor: 'og_video'
  data_type: 'varchar'
  is_nullable: 1
  size: 1000

=cut

__PACKAGE__->add_columns(
  "product_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "title",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "description",
  { data_type => "varchar", is_nullable => 0, size => 1000 },
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
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
  },
  "og:title",
  {
    accessor => "og_title",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "og:description",
  {
    accessor => "og_description",
    data_type => "varchar",
    is_nullable => 1,
    size => 1000,
  },
  "og:image",
  {
    accessor => "og_image",
    data_type => "varchar",
    is_nullable => 1,
    size => 1000,
  },
  "og:video",
  {
    accessor => "og_video",
    data_type => "varchar",
    is_nullable => 1,
    size => 1000,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</product_id>

=back

=cut

__PACKAGE__->set_primary_key("product_id");

=head1 RELATIONS

=head2 product2categories

Type: has_many

Related object: L<Schema::Result::Product2category>

=cut

__PACKAGE__->has_many(
  "product2categories",
  "Schema::Result::Product2category",
  { "foreign.product_id" => "self.product_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 product2image

Type: might_have

Related object: L<Schema::Result::Product2image>

=cut

__PACKAGE__->might_have(
  "product2image",
  "Schema::Result::Product2image",
  { "foreign.product_id" => "self.product_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-06-06 10:19:04
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:QfD77ewV4lh+l79XT1Q/6g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
