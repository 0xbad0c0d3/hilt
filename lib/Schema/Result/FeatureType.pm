use utf8;
package Schema::Result::FeatureType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Schema::Result::FeatureType

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<feature_type>

=cut

__PACKAGE__->table("feature_type");

=head1 ACCESSORS

=head2 feature_type_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 title

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 class

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 item_class

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 template

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "feature_type_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "title",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "class",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "item_class",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "template",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</feature_type_id>

=back

=cut

__PACKAGE__->set_primary_key("feature_type_id");

=head1 RELATIONS

=head2 feature2values

Type: has_many

Related object: L<Schema::Result::Feature2value>

=cut

__PACKAGE__->has_many(
  "feature2values",
  "Schema::Result::Feature2value",
  { "foreign.feature_type_id" => "self.feature_type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-06-30 14:26:09
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Ylh0O2T8894XdgkUkwwqqQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
