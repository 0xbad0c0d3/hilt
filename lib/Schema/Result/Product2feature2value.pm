use utf8;
package Schema::Result::Product2feature2value;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Schema::Result::Product2feature2value

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<product2feature2value>

=cut

__PACKAGE__->table("product2feature2value");

=head1 ACCESSORS

=head2 product_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 feature_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 feature2value_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "product_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "feature_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "feature2value_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</product_id>

=back

=cut

__PACKAGE__->set_primary_key("product_id");

=head1 RELATIONS

=head2 feature

Type: belongs_to

Related object: L<Schema::Result::Feature>

=cut

__PACKAGE__->belongs_to(
  "feature",
  "Schema::Result::Feature",
  { feature_id => "feature_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 feature2value

Type: belongs_to

Related object: L<Schema::Result::Feature2value>

=cut

__PACKAGE__->belongs_to(
  "feature2value",
  "Schema::Result::Feature2value",
  { feature2value_id => "feature2value_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-08-17 13:54:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6wzTRe0UvGMzLOQDvCwYkA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
